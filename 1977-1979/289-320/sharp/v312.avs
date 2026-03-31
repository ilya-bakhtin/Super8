import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v312 = LSMASHVideoSource(dst_dir + "v312rc.mp4")

v312 = v312.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v312 = v312.convertToYV12(interlaced=false)

v312 = v312.UnsharpMask(strength=500, radius=5, threshold=1)
v312 = v312.adjustBorders

va = BlankClip(v312, audio_rate = 48000, channels = 2).killVideo
v312 = v312.audioDub(va)

return v312.Prefetch

