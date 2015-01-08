--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Control.Applicative ((<$>))
import           Data.Monoid (mappend, mconcat)
import           Hakyll
import           Control.Monad (forM_)

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match "favicon.ico" $ do
      route   idRoute
      compile copyFileCompiler

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["me.html", "index.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    forM_ [ "ru", "life", "universe" ] $ \x ->
      match (fromGlob $ "posts/" ++ x ++ "/*") $ do
          route $ setExtension "html"
          compile $ pandocCompiler
              >>= loadAndApplyTemplate "templates/post.html"    postCtx
              >>= saveSnapshot "content"
              >>= loadAndApplyTemplate "templates/default.html" postCtx
              >>= relativizeUrls

    forM_ [ "ru", "life", "universe" ] $ \x -> do
      create [x] $ do
        route $ setExtension "html"
        compile $ do
            posts <- recentFirst =<< loadAll (fromGlob $ "posts/" ++ (toFilePath x) ++ "/*")
            let archiveCtx =
                    listField  (toFilePath x) postCtx (return posts)    `mappend`
                    constField "title"  (title $ toFilePath x)          `mappend`
                    defaultContext
            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
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

    create ["atom.xml"] $ do
        route idRoute
        compile $ do
          posts <- recentFirst =<< loadAllSnapshots "posts/*/*" "content"
          renderRss feedConfig feedCtx posts

    create ["universe.xml"] $ do
        route idRoute
        compile $ do
          posts <- (take 50) <$> (recentFirst =<< loadAllSnapshots "posts/universe/*" "content")
          renderRss feedConfig feedCtx posts

    create ["ru.xml"] $ do
        route idRoute
        compile $ do
          posts <- (take 50) <$> (recentFirst =<< loadAllSnapshots "posts/ru/*" "content")
          renderRss feedConfig feedCtx posts

    create ["life.xml"] $ do
        route idRoute
        compile $ do
          posts <- (take 50) <$> (recentFirst =<< loadAllSnapshots "posts/life/*" "content")
          renderRss feedConfig feedCtx posts

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

feedCtx =
    bodyField "description" `mappend`
    postCtx

title "ru" = "Публикации на русском"
title "life" = "Life"
title "universe" = "Universe"

feedConfig = FeedConfiguration { 
     feedTitle       = "Life, Universe and Everything"
    ,feedDescription = "A personal blog about functional programming, information security, operating systems, literature and other (less interesting) topcis."
    ,feedAuthorName  = "Jonn Mostovoy"
    ,feedAuthorEmail = "jm at this domain"
    ,feedRoot        = "http://memorici.de"
}
