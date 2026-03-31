import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v273 = LSMASHVideoSource(dst_dir + "v273rc.mp4")

v273 = v273.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v273 = v273.convertToYV12(interlaced=false)

v273 = v273.UnsharpMask(strength=500, radius=5, threshold=1)
v273 = v273.adjustBorders

va = BlankClip(v273, audio_rate = 48000, channels = 2).killVideo
v273 = v273.audioDub(va)

return v273.Prefetch

