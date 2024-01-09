import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v125 = LSMASHVideoSource(dst_dir + "v125rc.mp4")

v125 = v125.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v125 = v125.convertToYV12(interlaced=false)

v125 = v125.UnsharpMask(strength=500, radius=5, threshold=1)
v125 = v125.adjustBorders

va = BlankClip(v125, audio_rate = 48000, channels = 2).killVideo
v125 = v125.audioDub(va)

return v125.Prefetch

