LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v137 = LSMASHVideoSource(dst_dir + "v137rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v137f.mp4")
v137 = ImageSource(file = dst_dir + "v137-png\v137-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v137 = v137.convertToY.adjustSize

#v137 = v137.extractY.convertToYV12(interlaced=false)
#v137 = v137.deScratch.extractY

v137 = v137.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v137 = v137.convertBits(8).convertToYV12(interlaced=false)

v137 = v137.deScratch.extractY
v137 = v137.removeDirt
v137 = v137.convertToYV12(interlaced=false)
v137 = v137.UnsharpMask(strength=400, radius=5, threshold=1)
v137 = v137.adjustBorders
#v137 = v137.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v137 = v137.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v137, audio_rate = 48000, channels = 2).killVideo
v137 = v137.audioDub(va)

return v137.Prefetch

