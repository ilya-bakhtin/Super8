import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v241 = LSMASHVideoSource(dst_dir + "v241rc.mp4")

v241 = v241.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v241 = v241.convertToYV12(interlaced=false)

v241 = v241.UnsharpMask(strength=500, radius=5, threshold=1)
v241 = v241.adjustBorders

va = BlankClip(v241, audio_rate = 48000, channels = 2).killVideo
v241 = v241.audioDub(va)

return v241.Prefetch

