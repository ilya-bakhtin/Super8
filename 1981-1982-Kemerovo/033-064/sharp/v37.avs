import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v37 = LSMASHVideoSource(dst_dir + "v37rc.mp4")

v37 = v37.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v37 = v37.convertToYV12(interlaced=false)

v37 = v37.UnsharpMask(strength=500, radius=5, threshold=1)
v37 = v37.adjustBorders

va = BlankClip(v37, audio_rate = 48000, channels = 2).killVideo
v37 = v37.audioDub(va)

return v37.Prefetch

