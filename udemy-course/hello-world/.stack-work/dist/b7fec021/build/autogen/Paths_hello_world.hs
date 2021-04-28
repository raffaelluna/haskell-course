{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_hello_world (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\raffa\\Documents\\Repos\\haskell-course\\hello-world\\.stack-work\\install\\85c73802\\bin"
libdir     = "C:\\Users\\raffa\\Documents\\Repos\\haskell-course\\hello-world\\.stack-work\\install\\85c73802\\lib\\x86_64-windows-ghc-8.0.1\\hello-world-0.1.0.0"
datadir    = "C:\\Users\\raffa\\Documents\\Repos\\haskell-course\\hello-world\\.stack-work\\install\\85c73802\\share\\x86_64-windows-ghc-8.0.1\\hello-world-0.1.0.0"
libexecdir = "C:\\Users\\raffa\\Documents\\Repos\\haskell-course\\hello-world\\.stack-work\\install\\85c73802\\libexec"
sysconfdir = "C:\\Users\\raffa\\Documents\\Repos\\haskell-course\\hello-world\\.stack-work\\install\\85c73802\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hello_world_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hello_world_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hello_world_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_world_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_world_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
