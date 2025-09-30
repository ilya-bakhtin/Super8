import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v173 = LSMASHVideoSource(dst_dir + "v173rc.mp4")

v173 = v173.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v173 = v173.convertToYV12(interlaced=false)

v173 = v173.UnsharpMask(strength=500, radius=5, threshold=1)
v173 = v173.adjustBorders

va = BlankClip(v173, audio_rate = 48000, channels = 2).killVideo
v173 = v173.audioDub(va)

return v173.Prefetch

