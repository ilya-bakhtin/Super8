import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v124 = LSMASHVideoSource(dst_dir + "v124rc.mp4")

v124 = v124.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v124 = v124.convertToYV12(interlaced=false)

v124 = v124.UnsharpMask(strength=500, radius=5, threshold=1)
v124 = v124.adjustBorders

va = BlankClip(v124, audio_rate = 48000, channels = 2).killVideo
v124 = v124.audioDub(va)

return v124.Prefetch

