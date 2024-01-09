import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")
v17 = LSMASHVideoSource(dst_dir + "v17rc.mp4")

v17 = v17.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v17 = v17.convertToYV12(interlaced=false)

v17 = v17.UnsharpMask(strength=500, radius=5, threshold=1)
v17 = v17.adjustBorders

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

return v17.Prefetch

