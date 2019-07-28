本程序为知乎文章《从傅里叶变换进阶到小波变换（三）》 https://zhuanlan.zhihu.com/p/68323379 的源代码。
1、'STFT_test_window.m'测试了窗函数的窗宽分别为[0.02,0.1,0.3]时的STFT结果。
2、'STFT_funciton.m'为'STFT_test_window.m'的组成函数。
3、本程序调用了'../Basic'目录下的My_FFT函数进行快速傅里叶变换，你也可以调用Matlab自带的fft函数进行傅里叶变换，使用'help fft'命令查看fft使用方法。
