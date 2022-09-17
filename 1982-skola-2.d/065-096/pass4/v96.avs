LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v96 = LSMASHVideoSource(dst_dir + "v96rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v96f.mp4")
v96 = ImageSource(file = dst_dir + "v96-png\v96-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v96 = v96.convertToY.adjustSize

#v96 = v96.extractY.convertToYV12(interlaced=false)
#v96 = v96.deScratch.extractY

v96 = v96.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v96 = v96.convertBits(8).convertToYV12(interlaced=false)

v96 = v96.deScratch.extractY
v96 = v96.removeDirt
v96 = v96.convertToYV12(interlaced=false)
v96 = v96.UnsharpMask(strength=400, radius=7, threshold=1)
v96 = v96.adjustBorders
#v96 = v96.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v96 = v96.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v96, audio_rate = 48000, channels = 2).killVideo
v96 = v96.audioDub(va)

return v96.Prefetch

