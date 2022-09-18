---
layout: post
title: Installing Aequilibrae plugin on QGIS linux
date: 2022-08-08 14:33 +0700
tags: troubleshoot
---

## Problem
Depending on your current setup, you might not be able install and use [Aequilibrae plugin](https://plugins.qgis.org/plugins/AequilibraE/) out of the box. I have this problem on linux and macos system. It works flawlessly on windows system. Just follow the manual and you good to go.

## Solution
It take me quite some time to figure it out what exactly the problem. Basically it come down to:
- missing dependency
- bug on download binaries functionality
- incompatible compiled binary version provided by plugin author

Here the steps I do to fix this problem
- Install Aequilibrae with plugin manager. You might have error like this

```
Couldn't load plugin 'AequilibraE' due to an error when calling its classFactory() method 

ModuleNotFoundError: No module named 'scipy' 
Traceback (most recent call last):
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 423, in _startPlugin
    plugins[packageName] = package.classFactory(iface)
  File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/__init__.py", line 32, in classFactory
    from .AequilibraEMenu import AequilibraEMenu
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
    mod = _builtin_import(name, globals, locals, fromlist, level)
  File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/AequilibraEMenu.py", line 31, in 
    from .distribution_procedures import DistributionModelsDialog
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
    mod = _builtin_import(name, globals, locals, fromlist, level)
  File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/distribution_procedures/__init__.py", line 21, in 
    from .distribution_models_dialog import DistributionModelsDialog
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
    mod = _builtin_import(name, globals, locals, fromlist, level)
  File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/distribution_procedures/distribution_models_dialog.py", line 13, in 
    from ..matrix_procedures import LoadMatrixDialog, LoadDatasetDialog, DisplayAequilibraEFormatsDialog
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
    mod = _builtin_import(name, globals, locals, fromlist, level)
  File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/matrix_procedures/__init__.py", line 1, in 
    from .load_matrix_class import LoadMatrix
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
    mod = _builtin_import(name, globals, locals, fromlist, level)
  File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/matrix_procedures/load_matrix_class.py", line 25, in 
    from scipy.sparse import coo_matrix
  File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
    mod = _builtin_import(name, globals, locals, fromlist, level)
ModuleNotFoundError: No module named 'scipy'


Python version: 3.10.5 (main, Aug  1 2022, 07:53:20) [GCC 12.1.0] 
QGIS version: 3.26.1-Buenos Aires Buenos Aires, exported 

Python Path:
/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/aequilibrae
/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/aequilibrae
/usr/share/qgis/python
/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python
/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins
/usr/share/qgis/python/plugins
/usr/lib/python310.zip
/usr/lib/python3.10
/usr/lib/python3.10/lib-dynload
/home/zackad/.local/lib/python3.10/site-packages
/usr/lib/python3.10/site-packages
/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python
```

You need to install some dependencies manually with `pip` command. In this case run `pip install scipy`. Do the same until there's no error loading the plugin. Restart QGIS for this to take effect.

- Right click on Toolbar and make sure that Aequilibrae panel is checked
- Click "Download binaries". The version I'm using has a bug that prevent me to download binaries. It might have been fixed and upated when you read this article.
- Open file `/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/binary_downloader_class.py` and change this on line 27

```diff
-   par = yaml.load(yml)
+   par = yaml.safe_load(yml)
```

- Restart QGIS. Now you should be able to download the binaries
- Click "GIS -> Desire Line" on Aequilibrae panel and you will trigger another error. If you open "Log messages" panel from "View -> Panels -> Log messages", you will find something like this on "Python warnings" tab.

```
2022-08-08T15:03:07     WARNING    warning:/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/AequilibraEMenu.py:55: UserWarning: AequilibraE binaries are not available ("cannot import name 'allOrNothing' from 'AequilibraE.aequilibrae.aequilibrae.paths' (/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/aequilibrae/aequilibrae/paths/__init__.py)",)
              warn(f'AequilibraE binaries are not available {e.args}')

             traceback: File "", line 1, in 
              File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 443, in startPlugin
              if not _startPlugin(packageName):
              File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 423, in _startPlugin
              plugins[packageName] = package.classFactory(iface)
              File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/__init__.py", line 32, in classFactory
              from .AequilibraEMenu import AequilibraEMenu
              File "/usr/lib/python3.10/site-packages/qgis/utils.py", line 888, in _import
              mod = _builtin_import(name, globals, locals, fromlist, level)
              File "", line 1027, in _find_and_load
              File "", line 1006, in _find_and_load_unlocked
              File "", line 688, in _load_unlocked
              File "", line 883, in exec_module
              File "", line 241, in _call_with_frames_removed
              File "/home/zackad/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/AequilibraEMenu.py", line 55, in 
              warn(f'AequilibraE binaries are not available {e.args}')
```

- Compile aequilibrae binary manually
- Open terminal and navigate to `~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/AequilibraE/aequilibrae/aequilibrae/paths` directory
- Type `python setup_Assignment.py build_ext --inplace`
- Restart QGIS
