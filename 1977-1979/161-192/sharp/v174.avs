import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v174 = LSMASHVideoSource(dst_dir + "v174rc.mp4")

v174 = v174.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v174 = v174.convertToYV12(interlaced=false)

v174 = v174.UnsharpMask(strength=500, radius=5, threshold=1)
v174 = v174.adjustBorders

va = BlankClip(v174, audio_rate = 48000, channels = 2).killVideo
v174 = v174.audioDub(va)

return v174.Prefetch

