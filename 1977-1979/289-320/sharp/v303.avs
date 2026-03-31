import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v303 = LSMASHVideoSource(dst_dir + "v303rc.mp4")

v303 = v303.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v303 = v303.convertToYV12(interlaced=false)

v303 = v303.UnsharpMask(strength=500, radius=5, threshold=1)
v303 = v303.adjustBorders

va = BlankClip(v303, audio_rate = 48000, channels = 2).killVideo
v303 = v303.audioDub(va)

return v303.Prefetch

