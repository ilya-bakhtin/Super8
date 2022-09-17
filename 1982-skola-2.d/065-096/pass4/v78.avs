LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v78 = LSMASHVideoSource(dst_dir + "v78rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v78f.mp4")
v78 = ImageSource(file = dst_dir + "v78-png\v78-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v78 = v78.convertToY.adjustSize

#v78 = v78.extractY.convertToYV12(interlaced=false)
#v78 = v78.deScratch.extractY

v78 = v78.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v78 = v78.convertBits(8).convertToYV12(interlaced=false)

v78 = v78.deScratch.extractY
v78 = v78.removeDirt
v78 = v78.convertToYV12(interlaced=false)
v78 = v78.UnsharpMask(strength=400, radius=5, threshold=1)
v78 = v78.adjustBorders
#v78 = v78.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v78 = v78.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v78, audio_rate = 48000, channels = 2).killVideo
v78 = v78.audioDub(va)

return v78.Prefetch

