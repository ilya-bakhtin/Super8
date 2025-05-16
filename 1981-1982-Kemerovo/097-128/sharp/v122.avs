import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v122 = LSMASHVideoSource(dst_dir + "v122rc.mp4")

v122 = v122.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v122 = v122.convertToYV12(interlaced=false)

v122 = v122.UnsharpMask(strength=500, radius=5, threshold=1)
v122 = v122.adjustBorders

va = BlankClip(v122, audio_rate = 48000, channels = 2).killVideo
v122 = v122.audioDub(va)

return v122.Prefetch

