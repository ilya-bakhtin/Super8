import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v154 = LSMASHVideoSource(dst_dir + "v154rc.mp4")

v154 = v154.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v154 = v154.convertToYV12(interlaced=false)

v154 = v154.UnsharpMask(strength=500, radius=5, threshold=1)
v154 = v154.adjustBorders

va = BlankClip(v154, audio_rate = 48000, channels = 2).killVideo
v154 = v154.audioDub(va)

return v154.Prefetch

