import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v53 = LSMASHVideoSource(dst_dir + "v53rc.mp4")

v53 = v53.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v53 = v53.convertToYV12(interlaced=false)

v53 = v53.UnsharpMask(strength=500, radius=5, threshold=1)
v53 = v53.adjustBorders

va = BlankClip(v53, audio_rate = 48000, channels = 2).killVideo
v53 = v53.audioDub(va)

return v53.Prefetch

