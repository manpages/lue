--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll
import           Control.Monad (forM_)

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.rst", "contact.markdown", "index.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    forM_ [ "ru", "life", "universe" ] $ \x ->
      match (fromGlob $ "posts/" ++ x ++ "/*") $ do
          route $ setExtension "html"
          compile $ pandocCompiler
              >>= loadAndApplyTemplate "templates/post.html"    postCtx
              >>= loadAndApplyTemplate "templates/default.html" postCtx
              >>= relativizeUrls

    forM_ [ "ru", "life", "universe" ] $ \x ->
      create [x] $ do
        route $ setExtension "html"
        compile $ do
            posts <- recentFirst =<< loadAll (fromGlob $ "posts/" ++ (show x) ++ "/*")
            let archiveCtx =
                    listField  (show x) postCtx (return posts)    `mappend`
                    constField "title"  (title $ show x)          `mappend`
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html"   archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls


    create ["archive.html"] $ do
        route idRoute
        compile $ do
            life     <- recentFirst =<< loadAll "posts/life/*"
            universe <- recentFirst =<< loadAll "posts/universe/*"
            russian  <- recentFirst =<< loadAll "posts/ru/*"
            let archiveCtx =
                    listField  "life"     postCtx (return life)     `mappend`
                    listField  "universe" postCtx (return universe) `mappend`
                    listField  "ru"       postCtx (return russian)  `mappend`
                    constField "title"    "Everything"              `mappend`
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls


    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

title "ru" = "Посты на русском языке"
title "life" = "Life"
title "universe" = "Universe"
