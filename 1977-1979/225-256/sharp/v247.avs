import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v247 = LSMASHVideoSource(dst_dir + "v247rc.mp4")

v247 = v247.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v247 = v247.convertToYV12(interlaced=false)

v247 = v247.UnsharpMask(strength=500, radius=5, threshold=1)
v247 = v247.adjustBorders

va = BlankClip(v247, audio_rate = 48000, channels = 2).killVideo
v247 = v247.audioDub(va)

return v247.Prefetch

