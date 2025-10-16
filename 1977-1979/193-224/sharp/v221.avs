import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v221 = LSMASHVideoSource(dst_dir + "v221rc.mp4")

v221 = v221.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v221 = v221.convertToYV12(interlaced=false)

v221 = v221.UnsharpMask(strength=500, radius=5, threshold=1)
v221 = v221.adjustBorders

va = BlankClip(v221, audio_rate = 48000, channels = 2).killVideo
v221 = v221.audioDub(va)

return v221.Prefetch

