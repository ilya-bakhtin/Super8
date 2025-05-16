import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v94 = LSMASHVideoSource(dst_dir + "v94rc.mp4")

v94 = v94.Filter(th_SAD=1500, th_SADC=1500, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v94 = v94.convertToYV12(interlaced=false)

v94 = v94.UnsharpMask(strength=500, radius=5, threshold=1)
v94 = v94.adjustBorders

va = BlankClip(v94, audio_rate = 48000, channels = 2).killVideo
v94 = v94.audioDub(va)

return v94.Prefetch

