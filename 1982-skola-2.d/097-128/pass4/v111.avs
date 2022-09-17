LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v111 = LSMASHVideoSource(dst_dir + "v111rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v111f.mp4")
v111 = ImageSource(file = dst_dir + "v111-png\v111-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v111 = v111.convertToY.adjustSize

#v111 = v111.extractY.convertToYV12(interlaced=false)
#v111 = v111.deScratch.extractY

v111 = v111.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v111 = v111.convertBits(8).convertToYV12(interlaced=false)

v111 = v111.deScratch.extractY
v111 = v111.removeDirt
v111 = v111.convertToYV12(interlaced=false)
v111 = v111.UnsharpMask(strength=400, radius=5, threshold=1)
v111 = v111.adjustBorders
#v111 = v111.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v111 = v111.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v111, audio_rate = 48000, channels = 2).killVideo
v111 = v111.audioDub(va)

return v111.Prefetch

