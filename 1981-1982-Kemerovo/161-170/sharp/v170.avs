import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v170 = LSMASHVideoSource(dst_dir + "v170rc.mp4")

v170 = v170.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v170 = v170.convertToYV12(interlaced=false)

v170 = v170.UnsharpMask(strength=500, radius=5, threshold=1)
v170 = v170.adjustBorders

va = BlankClip(v170, audio_rate = 48000, channels = 2).killVideo
v170 = v170.audioDub(va)

return v170.Prefetch

