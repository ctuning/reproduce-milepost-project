Open64 is compiled as 32-bit even on Linux64.
Here in cM there is a problem since if we want to link openme.a, the last one is 64bit.
If we are on Linux64 and try to use Linux32, we need to manually (for now) add -m32 during library
compilation.
We should provide support for that in the future ...

Also we should use GCC 4.4.4 for compiling Open64 
(i.e. choose it in the upper right corner of the install web page)
