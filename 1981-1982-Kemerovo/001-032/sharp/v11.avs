import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v11 = LSMASHVideoSource(dst_dir + "v11rc.mp4")

v11 = v11.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v11 = v11.convertToYV12(interlaced=false)

v11 = v11.UnsharpMask(strength=500, radius=5, threshold=1)
v11 = v11.adjustBorders

va = BlankClip(v11, audio_rate = 48000, channels = 2).killVideo
v11 = v11.audioDub(va)

return v11.Prefetch

