import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v136 = LSMASHVideoSource(dst_dir + "v136rc.mp4")

v136 = v136.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v136 = v136.convertToYV12(interlaced=false)

v136 = v136.UnsharpMask(strength=500, radius=5, threshold=1)
v136 = v136.adjustBorders

va = BlankClip(v136, audio_rate = 48000, channels = 2).killVideo
v136 = v136.audioDub(va)

return v136.Prefetch

