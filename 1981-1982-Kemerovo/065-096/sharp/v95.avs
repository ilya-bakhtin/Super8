import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v95 = LSMASHVideoSource(dst_dir + "v95rc.mp4")

v95 = v95.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v95 = v95.convertToYV12(interlaced=false)

v95 = v95.UnsharpMask(strength=500, radius=5, threshold=1)
v95 = v95.adjustBorders

va = BlankClip(v95, audio_rate = 48000, channels = 2).killVideo
v95 = v95.audioDub(va)

return v95.Prefetch

