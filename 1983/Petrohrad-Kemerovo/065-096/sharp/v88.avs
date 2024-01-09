import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v88 = LSMASHVideoSource(dst_dir + "v88rc.mp4")

v88 = v88.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v88 = v88.convertToYV12(interlaced=false)

v88 = v88.UnsharpMask(strength=500, radius=5, threshold=1)
v88 = v88.adjustBorders

va = BlankClip(v88, audio_rate = 48000, channels = 2).killVideo
v88 = v88.audioDub(va)

return v88.Prefetch

