import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v76 = LSMASHVideoSource(dst_dir + "v76rc.mp4")

v76 = v76.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v76 = v76.convertToYV12(interlaced=false)

v76 = v76.UnsharpMask(strength=500, radius=5, threshold=1)
v76 = v76.adjustBorders

va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

return v76.Prefetch

