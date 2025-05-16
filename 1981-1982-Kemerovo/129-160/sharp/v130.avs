import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v130 = LSMASHVideoSource(dst_dir + "v130rc.mp4")

v130 = v130.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v130 = v130.convertToYV12(interlaced=false)

v130 = v130.UnsharpMask(strength=500, radius=5, threshold=1)
v130 = v130.adjustBorders

va = BlankClip(v130, audio_rate = 48000, channels = 2).killVideo
v130 = v130.audioDub(va)

return v130.Prefetch

