import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v74 = LSMASHVideoSource(dst_dir + "v74rc.mp4")

v74 = v74.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v74 = v74.convertToYV12(interlaced=false)

v74 = v74.UnsharpMask(strength=500, radius=5, threshold=1)
v74 = v74.adjustBorders

va = BlankClip(v74, audio_rate = 48000, channels = 2).killVideo
v74 = v74.audioDub(va)

return v74.Prefetch

