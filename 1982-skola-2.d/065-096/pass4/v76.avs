LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v76 = LSMASHVideoSource(dst_dir + "v76rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v76f.mp4")
v76 = ImageSource(file = dst_dir + "v76-png\v76-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v76 = v76.convertToY.adjustSize

#v76 = v76.extractY.convertToYV12(interlaced=false)
#v76 = v76.deScratch.extractY

v76 = v76.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v76 = v76.convertBits(8).convertToYV12(interlaced=false)

v76 = v76.deScratch.extractY
v76 = v76.removeDirt
v76 = v76.convertToYV12(interlaced=false)
v76 = v76.UnsharpMask(strength=400, radius=5, threshold=1)
v76 = v76.adjustBorders
#v76 = v76.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v76 = v76.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v76, audio_rate = 48000, channels = 2).killVideo
v76 = v76.audioDub(va)

return v76.Prefetch

