import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v126 = LSMASHVideoSource(dst_dir + "v126rc.mp4")

v126 = v126.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v126 = v126.convertToYV12(interlaced=false)

v126 = v126.UnsharpMask(strength=500, radius=5, threshold=1)
v126 = v126.adjustBorders

va = BlankClip(v126, audio_rate = 48000, channels = 2).killVideo
v126 = v126.audioDub(va)

return v126.Prefetch

