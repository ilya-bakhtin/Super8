import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v114 = LSMASHVideoSource(dst_dir + "v114rc.mp4")

v114 = v114.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v114 = v114.convertToYV12(interlaced=false)

v114 = v114.UnsharpMask(strength=500, radius=5, threshold=1)
v114 = v114.adjustBorders

va = BlankClip(v114, audio_rate = 48000, channels = 2).killVideo
v114 = v114.audioDub(va)

return v114.Prefetch

