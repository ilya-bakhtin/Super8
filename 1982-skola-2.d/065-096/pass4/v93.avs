LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v93 = LSMASHVideoSource(dst_dir + "v93rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v93f.mp4")
v93 = ImageSource(file = dst_dir + "v93-png\v93-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v93 = v93.convertToY.adjustSize

#v93 = v93.extractY.convertToYV12(interlaced=false)
#v93 = v93.deScratch.extractY

v93 = v93.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v93 = v93.convertBits(8).convertToYV12(interlaced=false)

v93 = v93.deScratch.extractY
v93 = v93.removeDirt
v93 = v93.convertToYV12(interlaced=false)
v93 = v93.UnsharpMask(strength=400, radius=7, threshold=1)
v93 = v93.adjustBorders
#v93 = v93.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v93 = v93.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v93, audio_rate = 48000, channels = 2).killVideo
v93 = v93.audioDub(va)

return v93.Prefetch

