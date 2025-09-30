import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v172 = LSMASHVideoSource(dst_dir + "v172rc.mp4")

v172 = v172.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v172 = v172.convertToYV12(interlaced=false)

v172 = v172.UnsharpMask(strength=500, radius=5, threshold=1)
v172 = v172.adjustBorders

va = BlankClip(v172, audio_rate = 48000, channels = 2).killVideo
v172 = v172.audioDub(va)

return v172.Prefetch

