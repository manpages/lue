mkdir dist
set -e
ghc -threaded -o dist/pkg site.hs
