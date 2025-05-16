import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v73 = LSMASHVideoSource(dst_dir + "v73rc.mp4")

v73 = v73.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v73 = v73.convertToYV12(interlaced=false)

v73 = v73.UnsharpMask(strength=500, radius=5, threshold=1)
v73 = v73.adjustBorders

va = BlankClip(v73, audio_rate = 48000, channels = 2).killVideo
v73 = v73.audioDub(va)

return v73.Prefetch

