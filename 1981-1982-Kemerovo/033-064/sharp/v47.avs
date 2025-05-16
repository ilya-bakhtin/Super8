import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v47 = LSMASHVideoSource(dst_dir + "v47rc.mp4")

v47 = v47.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v47 = v47.convertToYV12(interlaced=false)

v47 = v47.UnsharpMask(strength=500, radius=5, threshold=1)
v47 = v47.adjustBorders

va = BlankClip(v47, audio_rate = 48000, channels = 2).killVideo
v47 = v47.audioDub(va)

return v47.Prefetch

