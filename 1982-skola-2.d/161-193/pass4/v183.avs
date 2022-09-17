LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v183 = LSMASHVideoSource(dst_dir + "v183rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v183f.mp4")
v183 = ImageSource(file = dst_dir + "v183-png\v183-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v183 = v183.convertToY.adjustSize

#v183 = v183.extractY.convertToYV12(interlaced=false)
#v183 = v183.deScratch.extractY

v183 = v183.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v183 = v183.convertBits(8).convertToYV12(interlaced=false)

v183 = v183.deScratch.extractY
v183 = v183.removeDirt
v183 = v183.convertToYV12(interlaced=false)
v183 = v183.UnsharpMask(strength=400, radius=5, threshold=1)
v183 = v183.adjustBorders
#v183 = v183.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v183 = v183.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v183, audio_rate = 48000, channels = 2).killVideo
v183 = v183.audioDub(va)

return v183.Prefetch

