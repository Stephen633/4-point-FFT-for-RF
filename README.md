# 4-point-FFT-for-RF
A 4 point FFT for RF

the idea is about using FFT　implement　to FPGA as a thunder-fast computing and lighting-quick analize to the all sort of RF application

FFT is an improvement of DFT

                                DFT butterfly diagram for 2 point
                                
![image](https://github.com/Stephen633/4-point-FFT-for-RF/assets/72491010/5847a014-1a11-43e1-aabf-5fa3fef1ab49)


                                          4 point
                                          
![image](https://github.com/Stephen633/4-point-FFT-for-RF/assets/72491010/e2b3aabd-2845-47d2-a07d-ef6ea7e2eaca)

                              then we have formular for 4 point FFT

![image](https://github.com/Stephen633/4-point-FFT-for-RF/assets/72491010/1d68abc2-350f-42eb-b3f2-455ee9442bc1)

                              then we have arrange the formular

![image](https://github.com/Stephen633/4-point-FFT-for-RF/assets/72491010/11374e81-cc5f-4284-a033-d2ef033244d1)


In this VHD file, i used math_real library for floating-point computing, however, this library is NOT suitable for synthsis. 
it returns ERROR: [Synth 8-502] non-constant real-valued expression is not supported 

after searching in google and baidu, i found the solution for this problem which is using a new stanard of VHDL-2008
In VHDL-2008 it has a newer library for floating point that can able to synthsis


(solution for problem link (chinese): https://cloud.tencent.com/developer/ask/sof/107303665)

(solution for problem link (english): https://stackoverflow.com/questions/73778428)
