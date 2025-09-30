import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v162 = LSMASHVideoSource(dst_dir + "v162rc.mp4")

v162 = v162.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v162 = v162.convertToYV12(interlaced=false)

v162 = v162.UnsharpMask(strength=500, radius=5, threshold=1)
v162 = v162.adjustBorders

va = BlankClip(v162, audio_rate = 48000, channels = 2).killVideo
v162 = v162.audioDub(va)

return v162.Prefetch

