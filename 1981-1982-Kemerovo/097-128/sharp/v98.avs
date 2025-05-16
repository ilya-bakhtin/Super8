import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v98 = LSMASHVideoSource(dst_dir + "v98rc.mp4")

v98 = v98.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v98 = v98.convertToYV12(interlaced=false)

v98 = v98.UnsharpMask(strength=500, radius=5, threshold=1)
v98 = v98.adjustBorders

va = BlankClip(v98, audio_rate = 48000, channels = 2).killVideo
v98 = v98.audioDub(va)

return v98.Prefetch

