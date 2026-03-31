import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v229 = LSMASHVideoSource(dst_dir + "v229rc.mp4")

v229 = v229.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v229 = v229.convertToYV12(interlaced=false)

v229 = v229.UnsharpMask(strength=500, radius=5, threshold=1)
v229 = v229.adjustBorders

va = BlankClip(v229, audio_rate = 48000, channels = 2).killVideo
v229 = v229.audioDub(va)

return v229.Prefetch

