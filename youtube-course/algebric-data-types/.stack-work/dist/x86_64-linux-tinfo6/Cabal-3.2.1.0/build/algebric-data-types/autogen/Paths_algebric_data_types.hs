{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_algebric_data_types (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/raffael/Documents/repos/haskell-course/youtube-course/algebric-data-types/.stack-work/install/x86_64-linux-tinfo6/73a875a25c3431a3109d602383a3df580eb9eb745811cecd3531e94eae0920f6/8.10.4/bin"
libdir     = "/home/raffael/Documents/repos/haskell-course/youtube-course/algebric-data-types/.stack-work/install/x86_64-linux-tinfo6/73a875a25c3431a3109d602383a3df580eb9eb745811cecd3531e94eae0920f6/8.10.4/lib/x86_64-linux-ghc-8.10.4/algebric-data-types-0.1.0.0-HCKiJc4ExNG8JA1dF1voDr-algebric-data-types"
dynlibdir  = "/home/raffael/Documents/repos/haskell-course/youtube-course/algebric-data-types/.stack-work/install/x86_64-linux-tinfo6/73a875a25c3431a3109d602383a3df580eb9eb745811cecd3531e94eae0920f6/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/raffael/Documents/repos/haskell-course/youtube-course/algebric-data-types/.stack-work/install/x86_64-linux-tinfo6/73a875a25c3431a3109d602383a3df580eb9eb745811cecd3531e94eae0920f6/8.10.4/share/x86_64-linux-ghc-8.10.4/algebric-data-types-0.1.0.0"
libexecdir = "/home/raffael/Documents/repos/haskell-course/youtube-course/algebric-data-types/.stack-work/install/x86_64-linux-tinfo6/73a875a25c3431a3109d602383a3df580eb9eb745811cecd3531e94eae0920f6/8.10.4/libexec/x86_64-linux-ghc-8.10.4/algebric-data-types-0.1.0.0"
sysconfdir = "/home/raffael/Documents/repos/haskell-course/youtube-course/algebric-data-types/.stack-work/install/x86_64-linux-tinfo6/73a875a25c3431a3109d602383a3df580eb9eb745811cecd3531e94eae0920f6/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "algebric_data_types_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "algebric_data_types_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "algebric_data_types_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "algebric_data_types_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "algebric_data_types_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "algebric_data_types_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
