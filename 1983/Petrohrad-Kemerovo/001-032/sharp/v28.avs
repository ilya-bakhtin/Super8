import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v28 = LSMASHVideoSource(dst_dir + "v28rc.mp4")

v28 = v28.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v28 = v28.convertToYV12(interlaced=false)

v28 = v28.UnsharpMask(strength=500, radius=5, threshold=1)
v28 = v28.adjustBorders

va = BlankClip(v28, audio_rate = 48000, channels = 2).killVideo
v28 = v28.audioDub(va)

return v28.Prefetch

