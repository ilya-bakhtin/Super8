import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v89 = LSMASHVideoSource(dst_dir + "v89rc.mp4")

v89 = v89.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v89 = v89.convertToYV12(interlaced=false)

v89 = v89.UnsharpMask(strength=500, radius=5, threshold=1)
v89 = v89.adjustBorders

va = BlankClip(v89, audio_rate = 48000, channels = 2).killVideo
v89 = v89.audioDub(va)

return v89.Prefetch

