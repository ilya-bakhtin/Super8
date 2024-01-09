import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v106 = LSMASHVideoSource(dst_dir + "v106rc.mp4")

v106 = v106.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v106 = v106.convertToYV12(interlaced=false)

v106 = v106.UnsharpMask(strength=500, radius=5, threshold=1)
v106 = v106.adjustBorders

va = BlankClip(v106, audio_rate = 48000, channels = 2).killVideo
v106 = v106.audioDub(va)

return v106.Prefetch

