import("..\common.avs")
import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
v0 = LSMASHVideoSource(dst_dir + "v0rc.mp4")

v0 = v0.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v0 = v0.convertToYV12(interlaced=false)

v0 = v0.UnsharpMask(strength=500, radius=5, threshold=1)
v0 = v0.adjustBorders

va = BlankClip(v0, audio_rate = 48000, channels = 2).killVideo
v0 = v0.audioDub(va)

return v0.Prefetch

