import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v58 = LSMASHVideoSource(dst_dir + "v58rc.mp4")

v58 = v58.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v58 = v58.convertToYV12(interlaced=false)

v58 = v58.UnsharpMask(strength=500, radius=5, threshold=1)
v58 = v58.adjustBorders

va = BlankClip(v58, audio_rate = 48000, channels = 2).killVideo
v58 = v58.audioDub(va)

return v58.Prefetch

