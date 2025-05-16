import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v166 = LSMASHVideoSource(dst_dir + "v166rc.mp4")

v166 = v166.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v166 = v166.convertToYV12(interlaced=false)

v166 = v166.UnsharpMask(strength=500, radius=5, threshold=1)
v166 = v166.adjustBorders

va = BlankClip(v166, audio_rate = 48000, channels = 2).killVideo
v166 = v166.audioDub(va)

return v166.Prefetch

