import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v137 = LSMASHVideoSource(dst_dir + "v137rc.mp4")

v137 = v137.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v137 = v137.convertToYV12(interlaced=false)

v137 = v137.UnsharpMask(strength=500, radius=5, threshold=1)
v137 = v137.adjustBorders

va = BlankClip(v137, audio_rate = 48000, channels = 2).killVideo
v137 = v137.audioDub(va)

return v137.Prefetch

