LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

#import("common.avs")
import("..\1982-skola-2.avs")
#v79 = LSMASHVideoSource(dst_dir + "v79rc.mp4")
vf = LSMASHVideoSource(dst_dir + "v79f.mp4")
v79 = ImageSource(file = dst_dir + "v79-png\v79-%04d copy.png", pixel_type="RGB48", start=0, end=vf.frameCount-1, fps=18)

v79 = v79.convertToY.adjustSize

#v79 = v79.extractY.convertToYV12(interlaced=false)
#v79 = v79.deScratch.extractY

v79 = v79.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v79 = v79.convertBits(8).convertToYV12(interlaced=false)

v79 = v79.deScratch.extractY
v79 = v79.removeDirt
v79 = v79.convertToYV12(interlaced=false)
v79 = v79.UnsharpMask(strength=400, radius=5, threshold=1)
v79 = v79.adjustBorders
#v79 = v79.assumefps(18).AdjustFrameRate(preset_p = "slowest")
#v79 = v79.AdjustFrameRate(preset_p = "slowest") # use FPS from input file

va = BlankClip(v79, audio_rate = 48000, channels = 2).killVideo
v79 = v79.audioDub(va)

return v79.Prefetch

