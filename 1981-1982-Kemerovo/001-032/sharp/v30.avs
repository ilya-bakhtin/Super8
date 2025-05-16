import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v30 = LSMASHVideoSource(dst_dir + "v30rc.mp4")

v30 = v30.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v30 = v30.convertToYV12(interlaced=false)

v30 = v30.UnsharpMask(strength=500, radius=5, threshold=1)
v30 = v30.adjustBorders

va = BlankClip(v30, audio_rate = 48000, channels = 2).killVideo
v30 = v30.audioDub(va)

return v30.Prefetch

